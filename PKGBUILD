_gitname=zzzfm
pkgname=${_gitname}-git
pkgver=1.0.7.5.r0.gc7e340f
pkgrel=1
pkgdesc='Multi-panel tabbed file manager - gtk2 version'
arch=(i686 x86_64)
url="https://gitlab.com/skidoo/zzzfm"
license=(GPL3)
provides=('zzzfm')
conflicts=('zzzfm')
depends=('ffmpegthumbnailer' 'e2fsprogs' 'gdk-pixbuf2' 'glibc' 'gtk2>=2.24.32' 'hicolor-icon-theme' 'libudev')
makedepends=(intltool git)
optdepends=('dbus: dbus integration'
            'util-linux: disk eject support'
            'lsof: device processes'
            'wget: plugin download'
            'gksu: perform as root functionality'
            'udevil: mount as non-root user and mount networks'
            'udisks2: mount as non-root user'
            'udevil: mount and unmount without password'
            'pmount: mount as non-root user'
            'curlftpfs: mount FTP shares'
            'jmtpfs: mount MTP devices'
            'gphotofs: mount cameras'
            'ifuse: mount your iPhone/iPod Touch'
            'fuseiso: mount ISO files'
            'bash-completion: programmable completion for the bash shell')

source=(git+${url}.git)

sha256sums=(SKIP)

pkgver() {
    cd "${srcdir}/${_gitname}"    
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_gitname}"
  CONFIG_SHELL=/bin/bash ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="${pkgdir}" install
}
