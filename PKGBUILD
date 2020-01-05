# vim:set ts=2 sw=2 et:
# Maintainer: Gomasy <nyan@gomasy.jp>
# Contributor: 2GMon <t_2gmon@yahoo.co.jp>

pkgname=mikutter
pkgver=4.0.2
pkgrel=1
pkgdesc="a moest twitter client"
arch=('i686' 'x86_64')
url="http://mikutter.hachune.net/"
license=('MIT')
optdepends=('alsa-utils: sound notification support'
            'libnotify: notify support')
appimage=$pkgname-$pkgver-x86_64.AppImage
source=(
https://mikutter.hachune.net/bin/$appimage
mikutter.desktop
)

prepare() {
  chmod +x $appimage
  ./$appimage --appimage-extract

  find squashfs-root -type d -exec chmod 755 {} \;
}

package() {
  mkdir $pkgdir/opt
  cp -r $srcdir/squashfs-root $pkgdir/opt/mikutter

  mkdir -p $pkgdir/usr/bin
  cat <<'EOF' > $pkgdir/usr/bin/mikutter
#!/bin/sh
/opt/mikutter/AppRun $@
EOF
  chmod a+x $pkgdir/usr/bin/mikutter

  mkdir -p $pkgdir/usr/share/applications
  cp $srcdir/mikutter.desktop $pkgdir/usr/share/applications
  chmod a+x $pkgdir/usr/share/applications/mikutter.desktop
}

md5sums=('b7a01058072e16cfd5b4cfa6bb25d8c3'
         '82f7f4d37380871d3fde314fe51cf406' )
