# Maintainer: MatMoul <matmoul at the google email domain which is .com>

_githubuser=matmoul
_githubrepo=dokytree
_gitcommit=2c5d57e8aba8f9fd44e56876fa38da9d556491ee

pkgname=dokytree-git
pkgver=0.0.1.r2.2c5d57e
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
makedepends=('git')
source=("git+https://github.com/${_githubuser}/${_githubrepo}.git#commit=${_gitcommit}")
sha256sums=('SKIP')

prepare() {
	cd "${_githubrepo}"
	cat <<EOF > dokytree
#!/bin/bash
node /usr/share/dokytree/app.js \${1} \${2} \${3} \${4} \${5} \${6}
EOF
}

package() {
	cd "${_githubrepo}"
	install -D -m0644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	install -d -m0755 ${pkgdir}/usr/share/dokytree
	install -d -m0755 ${pkgdir}/usr/share/dokytree/samples
	cp -R src/* ${pkgdir}/usr/share/dokytree
	cp -R samples/* ${pkgdir}/usr/share/dokytree/samples
	install -D -m0755 dokytree ${pkgdir}/usr/bin/dokytree
}
