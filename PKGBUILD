# Maintainer: Wren Baxter <aur [at] wren.dev>

pkgname=d80-star-db-astap
pkgver=2023.03.30
pkgrel=1
pkgdesc="D80 star database for 10>FOV>0.15 degrees. Size 1.2GB"
arch=('any')
url="https://www.hnsky.org/astap.htm"
license=('LGPL3')
source=('sha256.chk')
md5sums=('SKIP')
optdepends=('astap-bin: binary GTk version'
    'astap-bin-qt5: binary Qt version'
    'astap: sourced Qt version'
    'astap-cli: CLI version'
    'hnsky-hg: planetarium program, hg-version'
    'hnsky-bin: planetarium program, bin-version')
makedepends=('gdown' 'unzip')
# gdown is a helper python script to pull large files from google drive,
# which have a "this file is too big to be scanned for viruses" warning before downloading

prepare() {
    gdown "https://drive.google.com/uc?id=1HJZQU7BXHc-OvS0BNi_b3Cu8ARy2px2K" -O d80.zip
    # WARNING: the hash in sha256.chk is from google's API, not the developer himself
    # there is a chance, however small, that the file was modified in transit to google drive
    # https://webapps.stackexchange.com/questions/39502/size-and-md5-hash-of-files-on-google-drive
    sha256sum -c sha256.chk
}

package() {
    echo "Unzipping archive..."
    mkdir -p "${pkgdir}"/opt/astap
    unzip -q d80.zip -d "${pkgdir}"/opt/astap
    chmod 755 -R "${pkgdir}"
    chmod 644 "${pkgdir}"/opt/astap/*
}

