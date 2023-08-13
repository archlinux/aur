# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: skydrome
# Contributor: IgnorantGuru http://igurublog.wordpress.com/contact-ignorantguru/

pkgname=spacefm-thermitegod-git
pkgver=2.1.0.r846.g9e6269d2
pkgrel=1
pkgdesc="Multi-panel tabbed file manager"
arch=(x86_64)
url="https://github.com/thermitegod/spacefm"
license=(GPL3)
depends=(gtk3 ffmpegthumbnailer exo fmt spdlog glibmm-2.68 pugixml zeromq zmqpp ztd-git python libsigc++-3.0)
makedepends=(git meson cmake magic_enum toml11 fish nlohmann-json cli11)
#cmake required to find toml11
#optdepends=('dbus: dbus integration'
#            'util-linux: disk eject support'
#            'lsof: device processes'
#            'wget: plugin download'
#            'gksu: perform as root functionality'
#            'udevil: mount as non-root user and mount networks'
#            'udisks2: mount as non-root user'
#            'pmount: mount as non-root user'
#            'curlftpfs: mount FTP shares'
#            'jmtpfs: mount MTP devices'
#            'gphotofs: mount cameras'
#            'ifuse: mount your iPhone/iPod Touch'
#            'fuseiso: mount ISO files')
conflicts=(spacefm spacefm-thermitegod)
provides=(spacefm spacefm-thermitegod)
source=("spacefm-thermitegod::git+https://github.com/thermitegod/spacefm.git")
sha256sums=('SKIP')

pkgver() {
  cd "spacefm-thermitegod"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "spacefm-thermitegod"
  arch-meson build
  ninja -C build
}

package() {
  cd "spacefm-thermitegod"
  DESTDIR="${pkgdir}" ninja -C build install
}