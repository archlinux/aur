# $Id: PKGBUILD 195553 2016-11-14 01:48:18Z anthraxx $
# Maintainer: PhotonX <photon89 [at] gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Shanto <shanto@hotmail.com>
# Contributor: Athurg <athurg@gooth.cn>
# Contributor: TDY <tdy@gmx.com>

pkgname=shutter
pkgver=0.97
pkgrel=1
pkgdesc="A featureful screenshot tool (formerly gscrot)"
arch=('any')
url="https://shutter-project.org/"
license=('GPL3')
depends=(xdg-utils imagemagick procps librsvg desktop-file-utils
         perl-{glib-object-introspection,number-bytes-human,x11-protocol}
         perl-{proc-{simple,processtable},net-dbus}
         perl-{sort-naturally,json,json-maybexs,xml-simple,www-mechanize,locale-gettext}
         perl-{file-{which,basedir,copy-recursive},xml-simple}
	 perl-carp-always perl-gtk3 'perl-gtk3-imageview>=9' perl-readonly perl-goocanvas2
	 perl-goocanvas2-cairotypes libwnck3 pango-perl)
optdepends=('gnome-web-photo: web screenshot support'
		'perl-image-exiftool: read and write EXIF data'
		'nautilus-sendto: send screenshots via mail'
		'perl-path-class: Imgur upload support'
		'perl-lwp-protocol-https: Imgur upload support'
		'perl-net-oauth: Imgur upload support'
		'bc: 3D Rotate and 3D Reflection plugins support'
		'perl-webservice-gyazo-b: Gyazo upload support')
source=("https://github.com/shutter-project/shutter/archive/v$pkgver.tar.gz")
sha512sums=('40315ee03a138c71c29e05e82202d4a1adc0d930aef163e643e757ea2674dd8470e7a4d7d8b38ab5d3386ce8b9d774cbbb9a8b4bc2cb4d5b3b13812c77cf4334')
prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # Fix tray icon under many icon themes, from Gentoo
  sed -e "/\$tray->set_from_icon_name/s:set_from_icon_name:set_from_file:" \
      -e "s:shutter-panel:/usr/share/icons/hicolor/scalable/apps/&.svg:" \
      -i bin/shutter
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="$pkgdir/usr" install
}


