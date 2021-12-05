# Maintainer: PhotonX <photon89 [at] gmail.com>

pkgname=shutter-git
_pkgname=shutter
pkgver=r1636.d6dcd492
pkgrel=1
pkgdesc="A featureful screenshot tool, git version"
arch=('any')
url="https://shutter-project.org/"
license=('GPL3')
conflicts=('shutter')
depends=(xdg-utils imagemagick procps librsvg desktop-file-utils
         perl-{glib-object-introspection,number-bytes-human,x11-protocol}
         perl-{proc-{simple,processtable},moo,net-dbus}
         perl-{sort-naturally,json,json-maybexs,xml-simple,www-mechanize,locale-gettext}
         perl-{file-{which,basedir,copy-recursive},xml-simple}
	 perl-carp-always perl-gtk3 'perl-gtk3-imageview>=10' perl-readonly perl-goocanvas2
	 perl-goocanvas2-cairotypes libwnck3 pango-perl)
optdepends=('gnome-web-photo: web screenshot support'
		'perl-image-exiftool: read and write EXIF data'
		'nautilus-sendto: send screenshots via mail'
		'perl-path-class: Imgur upload support'
		'perl-lwp-protocol-https: Imgur upload support'
		'perl-net-oauth: Imgur upload support'
		'bc: 3D Rotate and 3D Reflection plugins support'
		'perl-webservice-gyazo-b: Gyazo upload support')
makedepends=('git')
source=('shutter::git+https://github.com/shutter-project/shutter.git')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir/$_pkgname"
  make prefix="$pkgdir/usr" install
}

