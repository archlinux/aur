# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-system76-power
pkgver=48
pkgrel=3
pkgdesc="GNOME shell extension for System76 Power Management"
arch=('any')
url="https://gitlab.com/LFd3v/gnome-shell-extension-system76-power"
license=('MIT')
depends=(
  'gnome-shell'
  'system76-power'
)
makedepends=(
  'git'
  'typescript'
)
source=("git+https://gitlab.com/LFd3v/gnome-shell-extension-system76-power.git#tag=v$pkgver"
        'serw14.patch'
        'addw5.patch')
sha256sums=('cb37eb16e42989cef3c51b695d80f4ea21c7169006c36f13250fc5c09a781f12'
            '55f0506a8b4ce1a4b6e549a6b8a202f857434f1699223b70881b8b2646b597ab'
            '1f0eb266905c4053d505780c8746565ca877d36964e1e46e05bb2d27c9c29541')

prepare() {
  cd "$pkgname"

  # Add serw14
  # https://github.com/pop-os/gnome-shell-extension-system76-power/commit/c032106161e24e088e7304f984b1108fc778500a
  patch -Np1 -i ../serw14.patch

  # Add addw5
  # https://github.com/pop-os/gnome-shell-extension-system76-power/pull/101
  patch -Np1 -i ../addw5.patch
}

build(){
  cd "$pkgname"
  make
}


package() {
  cd "$pkgname"
  make DESTDIR="${pkgdir}" install

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
