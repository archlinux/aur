# Maintainer: Ondrej Kucera <ondrej.kucera@centrum.cz>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>

pkgname=jdk-docs
pkgver=8u45
_realver=8u45
_buildnum=b14
_javafxver=8.0.45
_javafxbuildnum=b13
pkgrel=1
pkgdesc="Java SE Development Kit Documentation 8"
arch=("any")
url="http://www.oracle.com/technetwork/java/index.html"
license=("custom")
options=("!strip" "docs" "libtool" "staticlibs" "!zipman")
source=("http://download.oracle.com/otn-pub/java/jdk/$_realver-$_buildnum/jdk-$_realver-docs-all.zip"
	"http://download.oracle.com/otn-pub/java/javafx/$_javafxver-$_javafxbuildnum/javafx-$_realver-apidocs.zip"
	"Java SE Development Kit 8 Documentation License Agreement"
	"Oracle Legal Notices"
       )
sha256sums=('bc83053e6730779a97077cf1246e7c57e46600294357ab37675555c1c6a11cbc'
            'ca3fa0ea160de1c3761c88cec3bc7925ef7cf1c260e76e700ea16f319f1e83b2'
            '14dc1953902010f7b48891e795183b39c048b19881815eec6a57cf3d62631ab7'
            '63626da8084eec01f7702aab6c62227fb4ddf249a428397da031be39940b689d')
noextract=("jdk-$_realver-docs-all.zip" "javafx-$_realver-apidocs.zip")

DLAGENTS=('http::/usr/bin/curl -LC - -b oraclelicense=a -O')

package() {
  mkdir -p "$pkgdir/usr/share/doc/java"
  bsdtar -xf "$srcdir/jdk-$_realver-docs-all.zip" -C "$pkgdir/usr/share/doc/java"
  mv "$pkgdir/usr/share/doc/java/docs" "$pkgdir/usr/share/doc/java/jdk"
  mkdir -p "$pkgdir/usr/share/doc/java/javafx"
  bsdtar -xf "$srcdir/javafx-$_realver-apidocs.zip" -C "$pkgdir/usr/share/doc/java/javafx"
  install -D -m644 "Java SE Development Kit 8 Documentation License Agreement" "$pkgdir/usr/share/licenses/$pkgname/Java SE Development Kit 8 Documentation License Agreement"
  install -D -m644 "Oracle Legal Notices" "$pkgdir/usr/share/licenses/$pkgname/Oracle Legal Notices"
  chown -R root:root "$pkgdir/usr/share/doc/java"
}
