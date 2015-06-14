# Maintainer: Lev Levitsky <levlev@mail.ru>
pkgname=msamanda
pkgver=1.0.0.4485
pkgrel=1
pkgdesc="A scoring system to identify peptides out of tandem mass spectrometry data using a database of known proteins"
arch=('any')
url="http://ms.imp.ac.at/?goto=msamanda"
license=('custom')
depends=('mono')
options=()
source=("http://ms.imp.ac.at/inc/pd-nodes/msamanda/MSAmanda_Standalone_LinuxMac_$pkgver.tar.gz"
        "LICENSE::http://ms.imp.ac.at/inc/pd-nodes/msamanda/LicenseAgreement_MSAmanda.rtf"
        "msamanda")
noextract=("MSAmanda_Standalone_LinuxMac_$pkgver.tar.gz")
md5sums=('2144b367817474a553abf12cfe2e4c8d'
         '7f0bf2c30c4d78b18a0138df20050abf'
         'a870877935f5aed33fd0a7ec73e5abca')

prepare() {
    mkdir "MSAmanda"
    bsdtar -xf "MSAmanda_Standalone_LinuxMac_$pkgver.tar.gz" -C MSAmanda
    chmod -R o+rx MSAmanda
}

package() {
    mkdir "$pkgdir/opt"
    cp -rt "$pkgdir/opt/" "$srcdir/MSAmanda"
    install -D "$srcdir/msamanda" "$pkgdir/usr/bin/msamanda"
    install -D "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
