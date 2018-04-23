# Maintainer: Andr0med4
# Contributor: Garrett <floft.net/contact>
pkgname=worldwind
pkgver=2.1.0
pkgrel=1
pkgdesc="an open source 3D interactive world viewer"
arch=('x86_64')
url="http://worldwind.arc.nasa.gov/java/"
license=('custom')
optdepends=('libtxc_dxtn: radeon and nouveau support')
source=('https://github.com/NASAWorldWind/WorldWindJava/releases/download/v2.1.0/worldwind-v2.1.0.zip')
md5sums=('22ab1fd93b851873e771650b9f5ec7e2')

package() {
	cd "$srcdir"

	mkdir -p "$pkgdir/usr/bin/"
	cat > "$pkgdir/usr/bin/worldwind" <<EOF
#!/bin/bash
cd '/usr/share/worldwind/';
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib/jogl"
java -Xmx512m -Djava.library.path=. -classpath ./src:./classes:./worldwind.jar:./worldwindx.jar:./jogl.jar:./gluegen-rt.jar:./gdal.jar gov.nasa.worldwindx.examples.ApplicationTemplate
EOF
	chmod +x "$pkgdir/usr/bin/worldwind"

	mkdir -p  "$pkgdir/usr/share/$pkgname"
	cp -r ./* "$pkgdir/usr/share/$pkgname/"
}
