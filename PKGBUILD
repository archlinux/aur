# vim:set ts=2 sw=2 et:
# Maintainer: 2GMon <t_2gmon@yahoo.co.jp>
pkgname=mikutter
#pkgver=3.5.0_alpha2
pkgver=3.5.2
pkgrel=1
pkgdesc="a moest twitter client"
arch=('i686' 'x86_64')
url="http://mikutter.hachune.net/"
license=('MIT')
depends=('ruby-gtk2>=2.2.3' 'ruby-moneta' 'ruby-nokogiri' 'ruby-httpclient' 'ruby-mini_portile2' 'ruby-totoridipjp')
optdepends=('libnotify: notify support')
source=(
#http://mikutter.hachune.net/bin/$pkgname.$pkgver.tar.gz
http://mikutter.hachune.net/bin/$pkgname.`echo "$pkgver" | tr "_" '-'`.tar.gz
mikutter.desktop
)

package() {
  # for ruby2.4
  rm "$srcdir/$pkgname/vendor/atk.rb"
  rm "$srcdir/$pkgname/vendor/atk.so"
  rm "$srcdir/$pkgname/vendor/cairo.rb"
  rm "$srcdir/$pkgname/vendor/cairo.so"
  rm -fr "$srcdir/$pkgname/vendor/cairo/"
  rm "$srcdir/$pkgname/vendor/gdk_pixbuf2.rb"
  rm "$srcdir/$pkgname/vendor/gdk_pixbuf2.so"
  rm "$srcdir/$pkgname/vendor/glib2.rb"
  rm "$srcdir/$pkgname/vendor/glib2.so"
  rm -fr "$srcdir/$pkgname/vendor/glib2"
  rm "$srcdir/$pkgname/vendor/gobject-introspection.rb"
  rm "$srcdir/$pkgname/vendor/gobject_introspection.so"
  rm -fr "$srcdir/$pkgname/vendor/gobject-introspection"
  rm "$srcdir/$pkgname/vendor/gtk2.rb"
  rm "$srcdir/$pkgname/vendor/gtk2.so"
  rm -fr "$srcdir/$pkgname/vendor/gtk2"
  rm "$srcdir/$pkgname/vendor/pango.rb"
  rm "$srcdir/$pkgname/vendor/pango.so"

  mkdir "$pkgdir/opt"
  cp -r "$srcdir/$pkgname" "$pkgdir/opt"

  mkdir -p "$pkgdir/usr/bin"
  cat <<'EOF' > "$pkgdir/usr/bin/mikutter"
#!/bin/sh
ruby /opt/mikutter/mikutter.rb $@
EOF
  chmod a+x "$pkgdir/usr/bin/mikutter"

  mkdir -p $pkgdir/usr/share/applications
  cp "$srcdir/mikutter.desktop" "$pkgdir/usr/share/applications"
  chmod +x $pkgdir/usr/share/applications/mikutter.desktop
}

md5sums=('33fdd576ca81355a8c713175639c871f'
         '18e28a76097af88457462b08752382df')
