# Maintainer: MatMoul <matmoul at the google email domain which is .com>

_githubuser=matmoul
_githubrepo=dokytree
_pkgtagname=v0.0.1

pkgname=dokytree
pkgver=0.0.1
pkgrel=1
pkgdesc='A versatil documentation system based on yaml files in directory tree with pugjs templates '
arch=('any')
url="https://github.com/${_githubuser}/${_githubrepo}"
license=('GPL3')
depends=('nodejs')
optdepends=(
	'code: To edit doc'
	'chromium: To view and print as pdf doc'
	'wget: To export doc as static pages'
)
source=("${_githubrepo}::https://github.com/${_githubuser}/${_githubrepo}/archive/refs/tags/${_pkgtagname}.tar.gz")
sha256sums=('56e34c4c4ca6966ab32bed6e8d0d41bff76b93290af28b5e3436c0c06a84e38c')

prepare() {
	ls
	cd "${_githubrepo}-${pkgver}"
	cat <<EOF > dokytree
#!/bin/bash
node /usr/share/dokytree/app.js \${1} \${2} \${3} \${4} \${5} \${6}
EOF
}

package() {
	cd "${_githubrepo}-${pkgver}"
	install -D -m0644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	install -d -m0755 ${pkgdir}/usr/share/dokytree
	install -d -m0755 ${pkgdir}/usr/share/dokytree/samples
	cp -R src/* ${pkgdir}/usr/share/dokytree
	cp -R samples/* ${pkgdir}/usr/share/dokytree/samples
	install -D -m0755 dokytree ${pkgdir}/usr/bin/dokytree
}
