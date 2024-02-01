# Maintainer: Rasmus Moorats <xx+aur@nns.ee>

_java=21
_java_minor=+13.1
pkgname="jdk${_java}-graalvm-ee-bin"
pkgver=21.0.2
pkgrel=1
pkgdesc="Universal virtual machine for running applications written in a variety of languages (JVM-based, LLVM-based, or other), Java ${_java} version"
arch=('x86_64'
	'aarch64')
url='https://www.graalvm.org/'
license=('custom:OTN')
depends=('java-runtime-common'
	'java-environment-common')
makedepends=()
provides=("java-runtime=${_java}"
	"java-environment=${_java}")
options=('staticlibs')
install="$pkgname.install"
source=('graalvm-ee-rebuild-libpolyglot.hook')
sha256sums=('7dc37bd3703ebebcd6efa39534e6bb6e3ec9c8ee0d97e46d6df5349739c7d2ca')
sha256sums_x86_64=('ee6286773c659afeefdf2f989a133e7a631c60897f2263ac183794ee1d6438f4')
sha256sums_aarch64=('dfac8d0e7ff8a128e8e8283e1ed6e3540dc44e7a9084c956e8deb9f84a268338')
source_x86_64=("https://download.oracle.com/graalvm/${_java}/archive/graalvm-jdk-${pkgver}_linux-x64_bin.tar.gz")
source_aarch64=("https://download.oracle.com/graalvm/${_java}/archive/graalvm-jdk-${pkgver}_linux-aarch64_bin.tar.gz")

package() {
	cd "graalvm-jdk-${pkgver}${_java_minor}"
	mkdir -p "$pkgdir/usr/lib/jvm/java-${_java}-graalvm-ee/"
	cp -a -t "$pkgdir/usr/lib/jvm/java-${_java}-graalvm-ee/" *
	install -DTm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	sed "s/JAVA/${_java}/g" <"../graalvm-ee-rebuild-libpolyglot.hook" >"graalvm-ee-jdk${_java}-rebuild-libpolyglot.hook"
	install -DTm644 "graalvm-ee-jdk${_java}-rebuild-libpolyglot.hook" "$pkgdir/usr/share/libalpm/hooks/graalvm-ee-jdk${_java}-rebuild-libpolyglot.hook"
}
