# Maintainer: Thomas Weißschuh <thomas t-8ch.de>

pkgname=filetea-git
pkgver=20140125
pkgrel=1
pkgdesc='Low friction, one-click anonymous file sharing.'
arch=(i686 x86_64)
url='https://gitorious.org/filetea/filetea'
license=('AGPL3')
depends=(evd-git)
optdepends=('jquery: to have automatic jquery updates')
makedepends=('git')
backup=('etc/filetea/filetead.conf')
source=('git+https://github.com/elima/FileTea'
        'filetea.service')

build() {
  cd "${srcdir}/FileTea"
  ./autogen.sh --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "${srcdir}"
  # systemd support
  install -D -m644 filetea.service "${pkgdir}/usr/lib/systemd/system/filetea.service"

  cd FileTea
  install -D -m644 filetead.conf "${pkgdir}/etc/filetea/filetead.conf"

  make DESTDIR="${pkgdir}/" install
}

pkgver() {
  date '+%Y%m%d'
}
sha256sums=('SKIP'
            'e9b40e6568729c557790e2b0b809b258eee2b18162b197db8cc4da4ff58ea52d')
sha256sums=('SKIP'
            'd8294aca58a31ffd4355e87faf144bef672ee7fb1c7265d02394fdabf28031d4')
