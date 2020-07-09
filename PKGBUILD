# Maintainer: imtbl <imtbl at mser dot at>
pkgname=filemaid-git
_pkgname=filemaid
pkgver=r2.9f1e46d
pkgrel=1
pkgdesc="Rule-based file- and folder-organization tool inspired by Belvedere and similar programs such as Hazel and DropIt"
arch=('any')
url="https://github.com/cryzed/${_pkgname}"
license=('MIT')
depends=('python' 'python-magic' 'python-pyaml')
source=("git+https://github.com/cryzed/${_pkgname}.git"
        shebang.patch)
sha256sums=('SKIP'
            '40942ee655d9257db61ad1c0ad0160d87096322b3baacf11ed86bba527e07bc8')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  git apply < ../shebang.patch
}

package() {
  install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm755 "$srcdir/$_pkgname/filemaid.py" "$pkgdir/usr/bin/filemaid"
}
