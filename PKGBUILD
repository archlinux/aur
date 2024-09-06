# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=mlink
pkgver=1.2.0
pkgrel=2
pkgdesc='A tool connecting mBlock web version to devices'
arch=(x86_64)
url='https://www.mblock.cc/en-us/download'
license=(custom) # main program licence is unknown, but bundled node_modules are various
install=$pkgname.install
# source from rpm not deb, because (a) makepkg auto-expands rpms and (b) permissions in rpm are already correct for mlink
# alternatively source=("https://dl.makeblock.com/mblock5/linux/mLink-1.2.0-amd64.deb")
source=("https://dl.makeblock.com/mblock5/linux/mLink-1.2.0-1.el7.x86_64.rpm")
sha256sums=('bf0233a2dbe996413c82341edb96c4a9317fdcddd62bbc1ea8699b2bf1c0c950')

prepare() {
  mkdir -p usr/bin
  ln -s /usr/local/makeblock/mLink/mlink usr/bin/mblock-mlink
}

package() {
  # install mlink
  cp -r usr "${pkgdir}"
  # install systemd service
  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  cp ../$pkgname.service "${pkgdir}/usr/lib/systemd/system"
}
