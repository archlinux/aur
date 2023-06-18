# Maintainer: Volker Schwaberow <volker@schwaberow.de>

pkgname=skoolkit
pkgver=8.10
pkgrel=2
pkgdesc="A suite of tools for creating disassemblies of ZX Spectrum games."
arch=('x86_64')
url="https://github.com/skoolkid/skoolkit"
license=('GPL')
dependes=('python')
source=("$pkgname-$pkgver.tar.xz::$url/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('b2d710f1b6e53d03f2d98e235392794a4e6a0c7a10846441504f5b885a798247')
options=('!lto')

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 bin2sna.py -t "$pkgdir/usr/bin"
  install -Dm 755 bin2tap.py -t "$pkgdir/usr/bin"
  install -Dm 755 skool2asm.py -t "$pkgdir/usr/bin"
  install -Dm 755 skool2bin.py -t "$pkgdir/usr/bin"
  install -Dm 755 skool2ctl.py -t "$pkgdir/usr/bin"
  install -Dm 755 skool2html.py -t "$pkgdir/usr/bin"
  install -Dm 755 sna2ctl.py -t "$pkgdir/usr/bin"
  install -Dm 755 sna2img.py -t "$pkgdir/usr/bin"
  install -Dm 755 sna2skool.py -t "$pkgdir/usr/bin"
  install -Dm 755 snapinfo.py -t "$pkgdir/usr/bin"
  install -Dm 755 snapmod.py -t "$pkgdir/usr/bin"
  install -Dm 755 tap2sna.py -t "$pkgdir/usr/bin"
  install -Dm 755 tapinfo.py -t "$pkgdir/usr/bin"
  install -Dm 755 trace.py -t "$pkgdir/usr/bin"
  install -Dm 644 docs/*.html -t "$pkgdir/usr/share/doc/$pkgname/docs"
  install -Dm 644 docs/_sources/*.txt -t "$pkgdir/usr/share/doc/$pkgname/docs/_sources"
  install -Dm 644 docs/_sources/man/*.txt -t "$pkgdir/usr/share/doc/$pkgname/docs/_sources/man"
  install -Dm 644 docs/_static/* -t "$pkgdir/usr/share/doc/$pkgname/docs/_static"
  install -Dm 644 COPYING "$pkgdir/usr/share/licenses/$pkgname"

  local pyver="$(python -c 'import platform; print(platform.python_version()[:4])')"

  install -d -m 755 "$pkgdir/usr/lib/python$pyver/site-packages/skoolkit"
  cp -r skoolkit/*.py "$pkgdir/usr/lib/python$pyver/site-packages/skoolkit/"
  
  install -d -m 755 "$pkgdir/usr/lib/python$pyver/site-packages/skoolkit/resources"
  cp -r skoolkit/resources/* "$pkgdir/usr/lib/python$pyver/site-packages/skoolkit/resources/"

}
