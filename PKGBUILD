# Maintainer: BadBoy <luckmelove2@gmail.com>

pkgname='sing-box-windows-bin'
_pkgname='sing-box-windows'
pkgver='2.3.0'
pkgrel='1'
pkgdesc='GUI for SingBox'
arch=('x86_64')

license=('MIT')

options=(!strip !debug)

depends=(
    'jq' 'curl'
    'libappindicator-gtk3' 'webkit2gtk-4.1' 'gtk3'
)

url="https://github.com/xinggaoya/${_pkgname}"

source=(
    "$(curl -s "$(echo $url | sed 's/github.com/api.github.com\/repos/g')/releases/latest" | jq -r '.assets[].browser_download_url' | grep '.deb')"
)

sha256sums=('d9cb79e1cc3ee48bfc122fd53601ba5b87c1d3c5778c910f151cc380d422c711')

prepare() {
    bsdtar -xpf "data.tar.gz"
}

package() {
    msg "make ${pkgname} package"
    cd "${srcdir}"

    mv -v "usr" "${pkgdir}"
}
