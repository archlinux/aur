# Maintainer: Kimiblock Moe

pkgname=(zen-browser-sponsorblock firefox-extension-sponsorblock librewolf-extension-sponsorblock)
pkgbase=firefox-browser-sponsorblock
pkgver=6.1.7
pkgrel=1
arch=('any')
url='https://github.com/ajayyy/SponsorBlock'
license=('GPL-3.0-only')
groups=('zen-browser-addons')
pkgdesc='Skip YouTube video sponsors'
makedepends=('nodejs' 'npm' 'unzip' 'zip' 'git' 'jq')
source=("source::git+https://github.com/ajayyy/SponsorBlock.git#tag=${pkgver}")
b2sums=('2530276dac6fdb2d3e1e7a441828d88566395811ae05ab9c22dd75f2ef309702aff4a8244c488dc8209dd954795652dd72d14cedf68e84321c569b6d26e12123')

function prepare() {
	cd "${srcdir}/source"
	git submodule update --init --recursive
	ln -srf config.json.example config.json
	npm ci
}

build() {
    cd "${srcdir}/source"
    npm run build:firefox
    cd dist
    zip ../addon.zip -r .
}

package_firefox-extension-sponsorblock() {
    cd "${srcdir}/source"
    install -Dm644 "${srcdir}/source/addon.zip" "${pkgdir}/usr/lib/firefox/browser/extensions/sponsorBlocker@ajay.app.xpi"
}

package_zen-browser-sponsorblock() {
    cd "${srcdir}/source"
    install -Dm644 "${srcdir}/source/addon.zip" "${pkgdir}/usr/lib/zen-browser/browser/extensions/sponsorBlocker@ajay.app.xpi"
}

package_librewolf-extension-sponsorblock() {
    cd "${srcdir}/source"
    install -Dm644 "${srcdir}/source/addon.zip" "${pkgdir}/usr/lib/librewolf/browser/extensions/sponsorBlocker@ajay.app.xpi"
}
