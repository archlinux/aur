# Maintainer: Tarn Burton <twburton at gmail dot com>
pkgname=maxima-jupyter-git
pkgver=r303.b3da307
pkgrel=1
pkgdesc="A Maxima kernel for Jupyter, based on CL-Jupyter (Common Lisp kernel)"
arch=("any")
url="https://github.com/robert-dodier/maxima-jupyter"
license=('BSD')
depends=("maxima")
source=(
  "$pkgname::git+https://github.com/robert-dodier/maxima-jupyter")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $pkgname
  install -Dm644 load-maxima-jupyter.lisp "$pkgdir/usr/share/maxima-jupyter/load-maxima-jupyter.lisp"
  install -Dm644 src/additions.lisp "$pkgdir/usr/share/maxima-jupyter/src/additions.lisp"
  install -Dm644 src/config.lisp "$pkgdir/usr/share/maxima-jupyter/src/config.lisp"
  install -Dm644 src/evaluator.lisp "$pkgdir/usr/share/maxima-jupyter/src/evaluator.lisp"
  install -Dm644 src/heartbeat.lisp "$pkgdir/usr/share/maxima-jupyter/src/heartbeat.lisp"
  install -Dm644 src/iopub.lisp "$pkgdir/usr/share/maxima-jupyter/src/iopub.lisp"
  install -Dm644 src/kernel.lisp "$pkgdir/usr/share/maxima-jupyter/src/kernel.lisp"
  install -Dm644 src/maxima-jupyter.asd "$pkgdir/usr/share/maxima-jupyter/src/maxima-jupyter.asd"
  install -Dm644 src/message.lisp "$pkgdir/usr/share/maxima-jupyter/src/message.lisp"
  install -Dm644 src/overrides-cl-info.lisp "$pkgdir/usr/share/maxima-jupyter/src/overrides-cl-info.lisp"
  install -Dm644 src/overrides.lisp "$pkgdir/usr/share/maxima-jupyter/src/overrides.lisp"
  install -Dm644 src/packages.lisp "$pkgdir/usr/share/maxima-jupyter/src/packages.lisp"
  install -Dm644 src/results.lisp "$pkgdir/usr/share/maxima-jupyter/src/results.lisp"
  install -Dm644 src/shell.lisp "$pkgdir/usr/share/maxima-jupyter/src/shell.lisp"
  install -Dm644 src/stdin.lisp "$pkgdir/usr/share/maxima-jupyter/src/stdin.lisp"
  install -Dm644 src/utils.lisp "$pkgdir/usr/share/maxima-jupyter/src/utils.lisp"
  install -Dm644 -d "$pkdir/usr/share/jupyter/kernels/maxima"
  python install-maxima-jupyter.py --root /usr/share/maxima-jupyter \
    --maxima /usr/bin/maxima --prefix "$pkgdir/usr"
  chmod 644 "$pkdir/usr/share/jupyter/kernels/maxima/kernel.json"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
