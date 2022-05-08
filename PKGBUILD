# Maintainer: <abishekj274@gmail.com>
pkgname=saladbind-git
pkgver=1.7.7.r3.gb8870b1
pkgrel=1
pkgdesc='A tool for Salad to customize your miner [git version]'
arch=('x86_64')
url="https://github.com/vtheskeleton/SaladBind"
license=("GPL3" "custom:'vukmoji'")
makedepends=("nodejs" "npm" "git")
source=("git+https://github.com/vtheskeleton/SaladBind.git" "https://raw.githubusercontent.com/Vukkyy/vukmoji/master/LICENSE")
options=("!strip")
provides=("saladbind")
conflicts=("saladbind")
sha256sums=('SKIP'
            '07d8a5e0a4ddae657a6839142ebcc54f94b8cba92920bedded536f3ffcc43809')

_gitname="SaladBind"

pkgver(){
	cd ${srcdir}/${_gitname}
	git describe --long --tags | sed 's/^v-//;s/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/v//'
}

build(){
	cd ${srcdir}/${_gitname}
	npm install
	node node_modules/pkg/lib-es5/bin.js src/index.js --targets node16-linux-x64 --output bin/saladbind
}

package(){
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/vukmoji_license.txt"
	install -Dm644 "${srcdir}/${_gitname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/saladbind_license.txt"
	install -Dm777 "${srcdir}/${_gitname}/bin/saladbind" "${pkgdir}/usr/bin/saladbind"
}
