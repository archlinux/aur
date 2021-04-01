# $Id: PKGBUILD 195553 2016-11-14 01:48:18Z anthraxx $
# Maintainer: PhotonX <photon89 [at] gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Shanto <shanto@hotmail.com>
# Contributor: Athurg <athurg@gooth.cn>
# Contributor: TDY <tdy@gmx.com>

pkgname=shutter
pkgver=0.95
pkgrel=2
pkgdesc="A featureful screenshot tool (formerly gscrot)"
arch=('any')
url="https://shutter-project.org/"
license=('GPL3')
depends=(xdg-utils imagemagick procps librsvg gtk2-perl desktop-file-utils gnomecanvas-perl
         perl-{glib-object-introspection,gnome2-wnck,gtk2-{imageview,unique},number-bytes-human,x11-protocol}
         perl-{proc-{simple,processtable},net-dbus}
         perl-{sort-naturally,json,json-maybexs,xml-simple,www-mechanize,locale-gettext}
         perl-{file-{which,basedir,copy-recursive},xml-simple})
optdepends=('gnome-web-photo: web screenshot support'
		'perl-image-exiftool: read and write EXIF data'
		'nautilus-sendto: send screenshots via mail'
		'perl-goo-canvas: editing screenshots'
		'perl-gtk2-appindicator: AppIndicators support'
		'perl-path-class: Imgur and Dropbox upload support'
		'perl-lwp-protocol-https: Imgur and Dropbox upload support'
		'perl-net-oauth: Imgur and Dropbox upload support'
		'bc: 3D Rotate and 3D Reflection plugins support'
		'perl-webservice-gyazo-b: Gyazo upload support')
source=("https://github.com/shutter-project/shutter/archive/v$pkgver.tar.gz")
sha512sums=('77df43b952c10e6280b12170de997c12e0e13d5868f80f1ab22ad9a062b4b67eb93dfc540d4ed0f5db2e950eaae8a258f3d01d9ddf6043d26f8f16f0ce93e75a')
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


