# Maintainer: Trains77 <aurpackages@aliases.trains77.xyz>
pkgname='sommelier-git'
pkgdesc='A Nested Wayland compositor with support for X11 forwarding'
pkgver=r60306.ec0f09b

pkgrel=1
arch=('x86_64')
depends=('xorg-xwayland')
url='https://chromium.googlesource.com/chromiumos/platform2.git/+/HEAD/vm_tools/sommelier'
makedepends=('meson' 'ninja' 'mariadb' 'python-jinja' 'python')
provides=('sommelier')
conflicts=('sommelier')
install="sommelier-git.install"
source=('git+https://chromium.googlesource.com/chromiumos/platform2.git')
sha256sums=('SKIP')

pkgver() {
  cd "platform2"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
cd platform2/vm_tools/sommelier
replace "/opt/google/cros-containers" "/usr" -- meson_options.txt
meson setup --prefix=/usr ./ build
cd build
meson compile
}


package() {
   install -Dm755 platform2/vm_tools/sommelier/build/sommelier -t "${pkgdir}"/usr/bin
}
