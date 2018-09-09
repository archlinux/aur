# $Id: PKGBUILD 195553 2016-11-14 01:48:18Z anthraxx $
# Maintainer: PhotonX <photon89 [at] gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Shanto <shanto@hotmail.com>
# Contributor: Athurg <athurg@gooth.cn>
# Contributor: TDY <tdy@gmx.com>

pkgname=shutter
pkgver=0.94.1
pkgrel=1
pkgdesc="A featureful screenshot tool (formerly gscrot)"
arch=('any')
url="http://shutter-project.org/"
license=('GPL3')
depends=(xdg-utils imagemagick procps librsvg gnome-perl gtk2-perl desktop-file-utils
         perl-{gnome2-wnck,gtk2-{imageview,unique},x11-protocol}
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
source=("https://launchpad.net/shutter/0.9x/$pkgver/+download/shutter-$pkgver.tar.gz")
sha512sums=('6637219d5d0d8ef856fface3cc0e7fa9f7a46cc4c03ec9270b00f3f764c2b9a361a05ca7ac013f78dd02d257e1c3d7232f309eb53dc0bc28d99eb6ad5e81fd99')
prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # Fix tray icon under many icon themes, from Gentoo
  sed -e "/\$tray->set_from_icon_name/s:set_from_icon_name:set_from_file:" \
      -e "s:shutter-panel:/usr/share/icons/hicolor/scalable/apps/&.svg:" \
      -i bin/shutter
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 bin/$pkgname "$pkgdir/usr/bin/$pkgname"
  cp -a share "$pkgdir/usr/"
}

