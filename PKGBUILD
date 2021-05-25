# $Id: PKGBUILD 195553 2016-11-14 01:48:18Z anthraxx $
# Maintainer: PhotonX <photon89 [at] gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Shanto <shanto@hotmail.com>
# Contributor: Athurg <athurg@gooth.cn>
# Contributor: TDY <tdy@gmx.com>

pkgname=shutter
pkgver=0.96
pkgrel=3
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
sha512sums=('0c7d13950bed216571278cec730a4986aae87effbf385d39805c0f0206c9fda30ec0cba4fe7cb36eebd9cd228c4ada35e21fd5170c9c442eee6934dac41c0c0f')
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


