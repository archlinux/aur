# Maintainer: Niluge_KiWi <kiwiiii@gmail.com>
# Contributor: Thomas Jost <schnouki@schnouki.net>
# Contributor: cantabile <cantabile dot desu at gmail dot com>
# created by cantabile <cantabile dot desu at gmail dot com>

pkgname=xkb-qwerty-fr
pkgver=0.7.2
pkgrel=1
pkgdesc="Keyboard layout based on the QWERTY layout with extra symbols and diacritics so that typing both in French and English is easy and fast. It is also easy to learn!"
arch=('any')
url="https://qwerty-fr.org/"
license=('GPL2')
depends=('xkeyboard-config' 'perl')
install=${pkgname}.install
source=("https://github.com/qwerty-fr/qwerty-fr/releases/download/v${pkgver}/qwerty-fr_${pkgver}_linux.deb"
        "xkb-qwerty-fr.hook")
md5sums=('9b3d85a368cd3360cca3b7abf9181191'
         'a48aeeed95e5309eb22399ec4455bfd3')
sha256sums=('24d375b5613e42e784c9c49cdfb83be0fe7fcd3c4d0071840286948d4ce92f97'
            '093d2b1d27f77ac5d0cff9a6057ceff18ddc73901a9636ba6533a8e40a63e3cc')

build() {
  cd "$srcdir"
  bsdtar xf data.tar.xz
  bsdtar xf control.tar.xz
}

package() {
  cd "$srcdir"

  install -D -m 755 postinst ${pkgdir}/usr/share/libalpm/scripts/xkb-qwerty-fr.install
  install -D -m 755 postrm ${pkgdir}/usr/share/libalpm/scripts/xkb-qwerty-fr.uninstall
  install -D -m 644 xkb-qwerty-fr.hook ${pkgdir}/usr/share/libalpm/hooks/xkb-qwerty-fr.hook

  install -D -m 644 usr/share/X11/xkb/symbols/us_qwerty-fr ${pkgdir}/usr/share/X11/xkb/symbols/us_qwerty-fr

  install -D -m 644 usr/share/doc/xkb-qwerty-fr/changelog.gz ${pkgdir}/usr/share/doc/xkb-qwerty-fr/changelog.gz
  install -D -m 644 usr/share/doc/xkb-qwerty-fr/copyright ${pkgdir}/usr/share/doc/xkb-qwerty-fr/copyright
  install -D -m 644 usr/share/doc/xkb-qwerty-fr/keymap.txt ${pkgdir}/usr/share/doc/xkb-qwerty-fr/keymap.txt

  install -D -m 644 usr/share/man/man7/qwerty-fr.7.gz ${pkgdir}/usr/share/man/man7/qwerty-fr.7.gz
}
