# Maintainer: tioguda  <guda.flavio@gmail.com>
# Contributor: Rafael Fontenlle <rafaelff@gnome.org>

pkgname=warsaw-bin
_pkgver=2.22.1-6
pkgver=${_pkgver/-/.}
pkgrel=6
pkgdesc="Provides the needed software to use some banking services"
arch=(x86_64)
url="https://www.topaz.com.br"
license=('GPL-3.0-or-later')
depends=('dbus' 'fontconfig' 'gcc' 'libcurl-gnutls' 'libstdc++' 'libxcursor' 'libxft' 'libxinerama' 'nss' 'procps-ng' 'python')
optdepends=('python-gpgme')
backup=('etc/init.d/warsaw' 'etc/init/warsaw.conf')
options=('!strip' '!emptydirs')
install=${pkgname}.install
conflicts=('warsaw')
provides=('warsaw')
source=("https://www.gnu.org/licenses/gpl-3.0.txt")
source_x86_64=("warsaw-${pkgver}-64.deb::https://cloud.gastecnologia.com.br/gas/diagnostico/warsaw_setup_64.deb")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('9ebc358b347b9d8e1416320b616a12fa4cbd2acf9d9954aa523c1c929e9f6618')

prepare() {
    cd "${srcdir}"
    ar -x warsaw-${pkgver}-64.deb
    tar -xJf data.tar.xz
}

package() {
    cd "${srcdir}"
    # dump etc files to /etc
    cp -r etc "$pkgdir"
    # dump usr files to /usr
    cp -r usr "$pkgdir"
    # dump lib files to /lib
    cp -r lib "$pkgdir/usr/"

    # Install copyright and license in proper directory
    install -Dm644 "${srcdir}/gpl-3.0.txt" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
    install -Dm644 "$pkgdir"/usr/share/{doc,licenses}/${pkgname%-bin}/copyright
    rm -rf "$pkgdir/usr/share/doc"
}
