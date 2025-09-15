# Maintainer: lumi200 <lumi200@posteo.eu>
_pkgname=Retro95
pkgname=greetd-${_pkgname,,}
pkgver=1.0.0
pkgrel=1
pkgdesc="A greeter in 95 OS design language"
arch=('x86_64')
url="https://gitlab.com/lumi200/retro95-greeter"
license=('GPL-3.0-or-later')
depends=('gtkmm-4.0' 'nlohmann-json' 'boost-libs' 'spdlog' 'greetd' 'tomlplusplus' 'libsigc++-3.0' 'gcc-libs' 'fmt' 'glib2' 'glibc' 'glibmm-2.68' 'systemd' 'systemd-libs')
makedepends=('meson' 'ninja' 'boost' 'tomlplusplus')
_archive="retro95-greeter-$pkgver"
source=("https://gitlab.com/lumi200/retro95-greeter/-/archive/$pkgver/$_archive.tar.gz")
b2sums=('567e79cbcaac3664b4147fbc59a076e5e344fb70ba660681899953f1dddc311f5fd2f92fe629243ed5c9fe7e453d563e00154e33537ebad3669f49890daaacbf')

build() {
  arch-meson $_archive build
  meson compile -C build
}

package() {
  install -Dm0755 build/retro95_greeter "$pkgdir/usr/bin/retro95-greeter"
  install -Dm0644 $_archive/systemd-tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/${_pkgname,,}.conf"
}
