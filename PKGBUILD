# Maintainer: Alexandre Bouvier <contact@amb.tf>
pkgname=jcdk-tools
pkgver=25.1
pkgrel=1
pkgdesc="Java Card Development Kit Tools"
arch=('any')
url="https://www.oracle.com/java/java-card/"
license=('LicenseRef-Oracle')
depends=('bash' 'java-runtime-headless>=17')
source=("https://download.oracle.com/otn-pub/java/java_card_kit/3.2/java_card_devkit_tools-bin-v$pkgver-b_611-26-OCT-2025.zip")
sha256sums=('57c469750c6db085997372e09366fd2771f609a9f9e14f8d0874f86a965eb6b5')

DLAGENTS=('https::/usr/bin/curl -qgb oraclelicense=accept-securebackup-cookie -fLC - --retry 3 --retry-delay 3 -o %o %u')

prepare() {
	sed -i -e "1a JAVA_HOME=/usr" -e "/^JC_LIBS=/c JC_LIBS=/usr/share/java/$pkgname" bin/*.sh
}

package() {
	local path
	for path in bin/*.sh; do
		# shellcheck disable=SC2154
		install -D "$path" "$pkgdir/usr/${path%.sh}"
	done
	install -Dm644 -t "$pkgdir"/usr/share/java/$pkgname lib/*.jar
}
