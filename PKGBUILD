# Maintainer: Attenuation <ouyangjun1999@gmail.com>
pkgname=pwngdb
pkgver=20190123.092321
pkgrel=1
pkgdesc='gdb for pwn'
url='https://github.com/scwuaptx/pwngdb'
arch=('any')
license=('GPLV3')
depends=('gdb' 'peda')
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')
install=pwngdb.install

prepare() {
  cd ${pkgname}
  sed 's|~/peda/peda.py|/usr/share/peda/peda.py|g' -i .gdbinit
  sed 's|~/Pwngdb/pwngdb.py|/usr/share/pwngdb/pwngdb.py|g' -i .gdbinit
  sed 's|~/Pwngdb/angelheap/gdbinit.py|/usr/share/pwngdb/angelheap/gdbinit.py|g' -i .gdbinit
}

build() {
  cd ${pkgname}
  msg2 'Compiling python objects...'
  python -m compileall . >/dev/null
  python -O -m compileall . >/dev/null
}

package() {
  cd ${pkgname}
  install -Dm 644 .gdbinit -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm 644 *.py -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm 644 __pycache__/* -t "${pkgdir}/usr/share/${pkgname}/__pycache__"
  install -Dm 644 angelheap/*.py -t "${pkgdir}/usr/share/${pkgname}/angelheap"
  install -Dm 644 angelheap/__pycache__/* -t "${pkgdir}/usr/share/${pkgname}/angelheap/__pycache__"
  install -Dm 644 pwndbg/*.py -t "${pkgdir}/usr/share/${pkgname}/pwndbg"
  install -Dm 644 pwndbg/__pycache__/* -t "${pkgdir}/usr/share/${pkgname}/pwndbg/__pycache__"
  install -Dm 644 pwndbg/commands/*.py -t "${pkgdir}/usr/share/${pkgname}/pwndbg/commands"
  install -Dm 644 pwndbg/commands/__pycache__/* -t "${pkgdir}/usr/share/${pkgname}/pwndbg/commands/__pycache__"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

