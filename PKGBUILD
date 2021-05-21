# Maintainer ZhangHua <zhanghua.00@qq.com>
pkgname=nrm-git
pkgver=1.2.2_b3ba7aa
pkgrel=1
pkgdesc='NPM registry manager, fast switch between different registries: npm, cnpm, nj, taobao'
provides=(nrm)
url=https://github.com/Pana/nrm
licence=('MIT')
source=(git+https://github.com/Pana/nrm)
arch=("any")
depends=(nodejs)
makedepends=(yarn jq)
sha256sums=('SKIP')
pkgver(){
	cd ${srcdir}/nrm
	echo $(jq -r ".version" package.json)_$(git rev-parse --short HEAD)
}
build(){
	cd ${srcdir}/nrm
	yarn install
}
package(){
	cd ${srcdir}/nrm
	mkdir -p ${pkgdir}/usr/bin
	ln -s ../lib/node_modules/nrm/cli.js ${pkgdir}/usr/bin/nrm
	mkdir -p ${pkgdir}/usr/lib/node_modules/nrm
	for file in node_modules cli.js LICENSE package.json README.md registries.json
	do
		cp -r ${file} ${pkgdir}/usr/lib/node_modules/nrm/${file}
	done
}
