# Maintainer: kriskras99 <admin at kriskras99 dot nl>
# Contributor: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: algebro <algebro at tuta dot io>

_pkgname=frida
pkgname=python-$_pkgname
pkgver=16.1.0
pkgrel=1
pkgdesc="Inject JavaScript to explore native apps on Windows, Mac, Linux, iOS and Android. Python 3 version from PyPi"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://www.frida.re"
license=('custom:wxWindows Library License, Version 3.1')
depends=('python')
optdepends=('python-typing_extensions: for Python <3.8')
# Sourced from https://pypi.org/project/frida/#files
source=("https://files.pythonhosted.org/packages/source/f/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "COPYING")
# Sourced from https://github.com/frida/frida/releases
source_i686=("frida-core-devkit-${pkgver}-linux.tar.xz::https://github.com/frida/frida/releases/download/${pkgver}/frida-core-devkit-${pkgver}-linux-x86.tar.xz")
source_x86_64=("frida-core-devkit-${pkgver}-linux.tar.xz::https://github.com/frida/frida/releases/download/${pkgver}/frida-core-devkit-${pkgver}-linux-x86_64.tar.xz")
source_armv7h=("frida-core-devkit-${pkgver}-linux.tar.xz::https://github.com/frida/frida/releases/download/${pkgver}/frida-core-devkit-${pkgver}-linux-armhf.tar.xz")
source_aarch64=("frida-core-devkit-${pkgver}-linux.tar.xz::https://github.com/frida/frida/releases/download/${pkgver}/frida-core-devkit-${pkgver}-linux-arm64.tar.xz")
sha256sums=('9805f2ab7e8d85b55822c6aedc0a52caab2d37609a19d228e3a7cc83188c2568'
            '5ea1544b51a28bc823b03159190d4108f9fb4f4ef912389f5137c6d295e175b2')
sha256sums_i686=('cf0b36ad12295eba99ea9f6403b5bdde05c7557af9a4f7a4bd80bc45651d5671')
sha256sums_x86_64=('1551965883495e97ff043657825351df2b03da888fcf4129a0cb7bd18930a287')
sha256sums_armv7h=('d4cdc6e9b7fa7fb559499ce97316e6a79ac1dba5dbdb864f01f56acdd908e9e9')
sha256sums_aarch64=('733750a12621f3cac0e34c383b3658617a2111ba79926c0746b281745604b3c7')
noextract=("frida-core-devkit-${pkgver}-linux.tar.xz")
conflicts=("python2-${_pkgname}")

prepare() {
  mkdir "$srcdir/frida-core-devkit-${pkgver}-linux"
  bsdtar -x --cd "$srcdir/frida-core-devkit-${pkgver}-linux" -f "frida-core-devkit-${pkgver}-linux.tar.xz"
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  FRIDA_CORE_DEVKIT="../frida-core-devkit-${pkgver}-linux" python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  FRIDA_CORE_DEVKIT="../frida-core-devkit-${pkgver}-linux" python setup.py install --root=$pkgdir --optimize=1 --skip-build

  cd "$srcdir"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m 644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/"
}
