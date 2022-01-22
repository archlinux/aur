pkgname=briar-desktop-bin
_pkgname=briar-desktop
pkgver=0.1.0.beta
pkgrel=1
_bin_ver=0.1.0
_build_type=beta
pkgdesc='Prototyping the next generation for Briar on desktop devices'
arch=(any)
url="https://code.briarproject.org/briar/briar-desktop"
license=('GPL')
# let's limit it to <18 just in case 18 comes out sooner than expected (causing our hard java-17-path to cause trouble):
depends=('java-runtime>=17' 'java-runtime<18' 'bash')
# a direct link to https://desktop.briarproject.org/jars/linux/briar-desktop-linux.jar
# would potentially cause issues whenever a new version gets released
# due to one path being used for all versions (and thus, checksum errors)
source=("${_pkgname}-${_bin_ver}-${_build_type}.zip::https://code.briarproject.org/briar/${_pkgname}/-/jobs/artifacts/${_bin_ver}-${_build_type}/download?job=rb_jar")
sha256sums=('d448c38e3f40ce9bd7407b3916750b27f5ce6a49d71b9a518865c38eeb282765')

package() {
  install -dm755 "$pkgdir/usr/bin/"
  cat << EOF > "$pkgdir/usr/bin/$pkgname"
#!/bin/sh
exec /usr/lib/jvm/java-17-openjdk/bin/java -jar '/usr/share/java/briar-desktop.jar' "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/$pkgname"

  install -m 644 -D ${_pkgname}.jar "$pkgdir/usr/share/java/$pkgname.jar"
}
