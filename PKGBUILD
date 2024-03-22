# Maintainer:  Marcel Novotny <marcel.novotny@gmail.com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Daniel Perez <tuvistavie@gmail.com>
# Contributor: Andrew Ayer <agwa@andrewayer.name>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: noirbizarre <noirbizarre@gmail.com>
# Contributor: Wael Nasreddine <wael.nasreddine@gmail.com>

pkgname=git-crypt-patched-git
pkgver=0.7.0_3_g6256625
pkgrel=1
_branch=master
pkgdesc='Transparent file encryption in Git with patch for worktree'
arch=(x86_64)
url="https://www.agwa.name/projects/${pkgname%-patched-git}/"
license=(GPL3)
depends=(git
         openssl)
makedepends=(libxslt)
provides=("${pkgname%-patched-git}")
conflicts=("${pkgname%-patched-git}")
source=("git+https://github.com/AGWA/${pkgname%-patched-git}.git#branch=$_branch"
        "https://github.com/AGWA/${pkgname%-patched-git}/pull/222.patch"
        "https://github.com/AGWA/${pkgname%-patched-git}/pull/249.patch")
sha256sums=('SKIP'
            '69d1cfbefbdf00bb7035050a00b49b6204ae0fc1213bd26a703407597c5790f8'
            'b8dc43540bfd80993359890a6064ef51a932d9e677b3cd62527c6cff4bdfc1f4')

pkgver() {
	cd "${pkgname%-patched-git}"
	git describe --long --tags | sed 's/^v//;s/-/_/g'
}
prepare() {
	cd "${pkgname%-patched-git}"
  git am ../222.patch
  git am ../249.patch
}

build() {
	cd "${pkgname%-patched-git}"
	make ENABLE_MAN=yes PREFIX=/usr
}

package() {
	cd "${pkgname%-patched-git}"
	make ENABLE_MAN=yes PREFIX=/usr DESTDIR="$pkgdir" install
}
