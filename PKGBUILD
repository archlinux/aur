pkgname=briar-desktop-bin
_pkgname=briar-desktop
pkgver=0.1.0.beta
pkgrel=2
_bin_ver=0.1.0
_build_type=beta
pkgdesc='Prototyping the next generation for Briar on desktop devices'
arch=(any)
url="https://code.briarproject.org/briar/briar-desktop"
license=('GPL')
# let's limit it to <18 just in case 18 comes out sooner than expected (causing our hard java-17-path to cause trouble):
depends=('java-runtime>=17' 'java-runtime<18' 'bash')
source=("https://desktop.briarproject.org/jars/linux/${_bin_ver}-${_build_type}/${_pkgname}-linux-${_bin_ver}-${_build_type}.jar")
sha256sums=('7e806486381222322cf5a8c7b366c17385ad3035fe8486c370f1af7b7fcf5239')

package() {
  install -dm755 "$pkgdir/usr/bin/"
  cat << EOF > "$pkgdir/usr/bin/$_pkgname"
#!/bin/sh
exec /usr/lib/jvm/java-17-openjdk/bin/java -jar '/usr/share/java/briar-desktop.jar' "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/$_pkgname"

  install -m 644 -D ${_pkgname}-linux-${_bin_ver}-${_build_type}.jar "$pkgdir/usr/share/java/$_pkgname.jar"
}
