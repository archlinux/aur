# Maintainer: ObserverOfTime <chronobserver@disroot.org>

_version=(22 6 47)
pkgname=jextract-bin
pkgver=22.6.47
pkgrel=1
pkgdesc='A tool which mechanically generates Java bindings from native library headers'
url='https://jdk.java.net/jextract/'
arch=(x86_64)
license=('GPL-2.0-or-later WITH Classpath-exception-2.0')
conflicts=('jextract')
provides=('jextract')
depends=(glibc zlib)
source=("https://download.java.net/java/early_access/jextract/${_version[0]}/${_version[1]}/openjdk-${_version[0]}-jextract+${_version[1]}-${_version[2]}_linux-x64_bin.tar.gz"
        "https://raw.githubusercontent.com/openjdk/jextract/77ccb48/LICENSE")
b2sums=('1a293f2feaf3293f77090d0b1cf7ef7f3969ca5b2341e18e2d8d80b284950c501edd1b03ed2f42a1de13c5d2a202c64025c9c29cc150bf8015fe3abf3dc466e1'
        '32647f81f19b29ff05b8909cdf7690086d0f91748513105967dc0dbeacca7bd051b5d14ec1aec1d3857b158f225311ff52ee1c4d7fb1416f1020d14d92a23858')

pkgver() {
  printf '%s.%s.%s' "${_version[@]}"
}

package() {
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/usr/lib"
  cp -r "jextract-${_version[0]}/runtime" "${pkgdir}/usr/lib/jextract"
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/jextract" <<'EOF'
#!/bin/sh

exec /usr/lib/jextract/bin/java $JEXTRACT_JAVA_OPTIONS \
  -m org.openjdk.jextract/org.openjdk.jextract.JextractTool "$@"
EOF
}
