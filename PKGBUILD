# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: skydrome
# Contributor: IgnorantGuru http://igurublog.wordpress.com/contact-ignorantguru/

pkgname=spacefm-thermitegod-git
pkgver=2.1.0.r1339.g8dcdad46
pkgrel=2
pkgdesc="Multi-panel tabbed file manager"
arch=(x86_64)
url="https://github.com/thermitegod/spacefm"
license=(GPL3)
depends=(gtk3 gtkmm3 ffmpegthumbnailer exo fmt spdlog pugixml zeromq zmqpp python concurrencpp libgexiv2

        # namcap implicit depends
        gdk-pixbuf2 ffmpeg glibmm openssl libsigc++ systemd-libs pango glib2 hicolor-icon-theme glibc gcc-libs)
depends+=(libspdlog.so)
makedepends=(git meson cmake magic_enum toml11 fish nlohmann-json cli11 libsigc++-3.0)
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
conflicts=(spacefm spacefm-thermitegod ztd-git)
provides=(spacefm spacefm-thermitegod)
source=("spacefm-thermitegod::git+https://github.com/thermitegod/spacefm.git")
sha256sums=('SKIP')

pkgver() {
  cd "spacefm-thermitegod"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "spacefm-thermitegod"
  arch-meson build --wrap-mode default
  ninja -C build
}

package() {
  cd "spacefm-thermitegod"
  DESTDIR="${pkgdir}" ninja -C build install
}
