# Maintainer: skydrome
# Contributor: IgnorantGuru http://igurublog.wordpress.com/contact-ignorantguru/

GTK=3

pkgname="spacefm-git"
pkgver=20180420
pkgrel=1
pkgdesc="A multi-panel tabbed file manager - git branch"
arch=('i686' 'x86_64')
url="https://github.com/IgnorantGuru/spacefm"
license=('GPL3')
conflicts=("spacefm")
provides=("spacefm")
install='spacefm.install'
makedepends=('intltool' 'gettext')
depends=('shared-mime-info' 'cairo' 'pango' 'dbus' 'glib2' 'wget' 'startup-notification' 'hicolor-icon-theme' 'desktop-file-utils' 'udevil' 'udisks2' 'ffmpegthumbnailer')
optdepends=('fuseiso: mount ISO filesystem images'
            'jmtpfs: mount MTP devices'
            'gphotofs: mount your camera as a filesystem'
            'ifuse: mount iPhone or iPod Touch')

if [[ "$GTK" = 2 ]]; then
    depends+=('gtk2'); _opts='--with-gtk2'
else
    depends+=('gtk3'); _opts='--with-gtk3'
fi

source=("git+https://github.com/IgnorantGuru/spacefm.git#branch=alpha")
sha512sums=(SKIP)

pkgver() {
    cd "$srcdir/spacefm"
    echo $(git log -1 --format="%cd" --date=short |tr -d -)
}

prepare() {
    cd "$srcdir/spacefm"
    ./autogen.sh --prefix=/usr $_opts
}

build() {
    cd "$srcdir/spacefm"
    make
}

package() {
    cd "$srcdir/spacefm"
    make DESTDIR="$pkgdir" install
    rm -f "$pkgdir"/usr/bin/spacefm-installer
}
