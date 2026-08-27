# Maintainer: Mike Boiko <mike@boiko.ca>

pkgname=twg-cli-bin
pkgver=1.2.6
pkgrel=1
pkgdesc='Atlassian Teamwork Graph CLI (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://developer.atlassian.com/cloud/twg-cli/'
license=('Apache-2.0')
depends=('glibc')
provides=('twg-cli')
conflicts=('twg' 'twg-cli')
options=('!strip' '!debug')

source=("twg-cli-LICENSE::https://raw.githubusercontent.com/atlassian/twg-cli/main/LICENSE")
source_x86_64=("twg-linux-x64-v${pkgver}::https://teamwork-graph.atlassian.com/cli/twg-linux-x64-v${pkgver}")
source_aarch64=("twg-linux-arm64-v${pkgver}::https://teamwork-graph.atlassian.com/cli/twg-linux-arm64-v${pkgver}")

sha256sums=('007879788b4d4a258cf924e4177a9f4f808b4aec5c2fd6ac65c09b526c07177f')
sha256sums_x86_64=('7973e5ff376a46597e9214295053e507d2e7a1b3b4d5c1a083f3a78453e6c750')
sha256sums_aarch64=('55f4442992a790dd3c2571fcf01dcab74b00c16c23a0c5b1cf654a84eed04eea')

package() {
	local binary

	if [[ "$CARCH" == x86_64 ]]; then
		binary="twg-linux-x64-v${pkgver}"
	else
		binary="twg-linux-arm64-v${pkgver}"
	fi

	install -Dm755 "$srcdir/$binary" "$pkgdir/usr/bin/twg"
	install -Dm644 "$srcdir/twg-cli-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
