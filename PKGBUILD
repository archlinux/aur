# Maintainer: ArchStrike <team@archstrike.org>

buildarch=220

pkgname=plasma-git
pkgver=20171015.r881
pkgrel=1
groups=('archstrike' 'archstrike-analysis')
arch=('armv6h' 'armv7h' 'i686' 'x86_64' 'aarch64')
pkgdesc="Interactive disassembler for x86/ARM/MIPS. Generates indented pseudo-code with colored syntax code."
url="https://github.com/plasma-disassembler/plasma"
license=('GPL3')
depends=('python-keystone' 'python-capstone' 'python-pyelftools' 'python-future' 'python-msgpack' 'binutils' 'python-pefile')
optdepends=('python-pyqt4: For memory map')
makedepends=('git')
source=("${pkgname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.r%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)"
}


package() {
  cd ${pkgname}
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  python setup.py install --root "${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
