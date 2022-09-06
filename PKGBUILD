# Maintainer: Niluge_KiWi <kiwiiii@gmail.com>
# Contributor: Thomas Jost <schnouki@schnouki.net>
# Contributor: cantabile <cantabile dot desu at gmail dot com>
# created by cantabile <cantabile dot desu at gmail dot com>

pkgname=xkb-qwerty-fr
pkgver=0.7.1
pkgrel=2
pkgdesc="Keyboard layout based on the QWERTY layout with extra symbols and diacritics so that typing both in French and English is easy and fast. It is also easy to learn!"
arch=('any')
url="https://qwerty-fr.org/"
license=('GPL2')
depends=('xkeyboard-config' 'perl')
install=${pkgname}.install
source=("https://github.com/qwerty-fr/qwerty-fr/releases/download/v${pkgver}/qwerty-fr_${pkgver}_linux.deb"
        "xkb-qwerty-fr.hook"
        "https://raw.githubusercontent.com/qwerty-fr/qwerty-fr/68294889a5d89e467f1f0ef7bec689900cb612ce/linux/us_qwerty-fr")
md5sums=('97687dbd6602bf08d0d8f2cd5799d79f'
         'a48aeeed95e5309eb22399ec4455bfd3'
         'b887daa12e2853bab659b2d4407a12c5')
sha256sums=('db8aa7861449e7e3ab9d8570b58cd47cb1fd77a72dad6e788124e0c8a3a51359'
            '093d2b1d27f77ac5d0cff9a6057ceff18ddc73901a9636ba6533a8e40a63e3cc'
            'cf629caa55634dcba32bc8cf615d35b009f163eff088dc92cd27876bef94b433')

build() {
  cd "$srcdir"
  bsdtar xf data.tar.xz
  bsdtar xf control.tar.xz

  # Use layout file without syntax error -- https://github.com/qwerty-fr/qwerty-fr/commit/3a4d13089e8ef016aa20baf6b2bf3ea53de674b8
  cp -f us_qwerty-fr usr/share/X11/xkb/symbols/us_qwerty-fr
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
