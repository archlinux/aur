# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: skydrome
# Contributor: IgnorantGuru http://igurublog.wordpress.com/contact-ignorantguru/

pkgname=spacefm-thermitegod
pkgver=2.1.0
pkgrel=3
pkgdesc="Multi-panel tabbed file manager"
arch=(x86_64)
url="https://github.com/thermitegod/spacefm"
license=(GPL3)
depends=(gtk2 ffmpegthumbnailer libbsd xxhash) # startup-notification
makedepends=(git meson exo)
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
conflicts=(spacefm)
provides=(spacefm)
source=("spacefm-thermitegod::git+https://github.com/thermitegod/spacefm.git#tag=v${pkgver}"
        "spacefm-thermitegod-001.patch::https://github.com/thermitegod/spacefm/commit/759cbbee78c8361e4d0df6f40f2ef80d85858124.patch"
        "spacefm-thermitegod-002.patch::https://github.com/thermitegod/spacefm/commit/12842e2e4e25e4cf4d67b0bedcbd61205b7b3a02.patch"
        "spacefm-thermitegod-003.patch::https://github.com/thermitegod/spacefm/commit/92edb59dfbb4293743bef744703ee863bf52dee3.patch"
        "spacefm-thermitegod-004.patch::https://github.com/thermitegod/spacefm/commit/5461e15f1451f21c1f625564a554a28f9fef07d8.patch")
sha256sums=('SKIP'
            'a8f3fc6c021ecdfe7fbfd83c35be41f108c2b8098edea976fd0bfac4e7d5f8ea'
            '51531f0ce5fa7c5814e704baaef23853254da076b5a42ccab210ec8dcf6565bb'
            'a8f6d98cb7b775e7c1ee8d4218230f1f1d2aac24ba150e1790db559d93e66efc'
            'e05baa8a1ccd7bb5c919de235bbe203e4a9e375ee0f4ef473acae53a23031fd5')

prepare() {
  cd "spacefm-thermitegod"
  patch -Np1 -i ../spacefm-thermitegod-001.patch
  patch -Np1 -i ../spacefm-thermitegod-002.patch
  patch -Np1 -i ../spacefm-thermitegod-003.patch
  patch -Np1 -i ../spacefm-thermitegod-004.patch
}

build() {
  CFLAGS+=" -Wno-error=incompatible-pointer-types"

  cd "spacefm-thermitegod"
  arch-meson build
  ninja -C build
}

package() {
  cd "spacefm-thermitegod"
  DESTDIR="${pkgdir}" ninja -C build install
}
