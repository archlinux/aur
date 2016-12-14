pkgname=pyq9-git
_pkgname=PyQ9
pkgver=r52.1ca7688
pkgrel=2
pkgdesc="Chinese IME in testing."
arch=('i686' 'x86_64')
url="https://gitlab.com/Saren/PyQ9"
depends=('xdotool' 'python-pillow' 'python-xlib' 'tk' 'xorg-xauth')
source=('git+https://gitlab.com/Saren/PyQ9.git' 'icon.png' 'pyq9.desktop')
sha256sums=('SKIP'
  '6a9320ae6d38cf6e6fc959c8af13fa1b16ecf19d01a1acb336c15452ad7e8753'
  '64cd33c5b11f57c266d517a132db4bff399ae75c93cbf92db9fcb43eef316935'
)

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p ${pkgdir}/opt/${_pkgname}
  install -Dm644 "icon.png" "${pkgdir}/opt/${_pkgname}/icon.png"
  install -Dm644 "pyq9.desktop" "${pkgdir}/usr/share/applications/pyq9.desktop"
  cd "${_pkgname}"
  install -Dm755 "main.py" "${pkgdir}/opt/${_pkgname}/pyq9"
  install -Dm644 "pyxhook.py" "${pkgdir}/opt/${_pkgname}/pyxhook.py"
  cp -r assets "${pkgdir}/opt/${_pkgname}"
}
