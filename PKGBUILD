# Maintainer: Doug Newgard <scimmia at archlinux dot info>

pkgname=epymc
pkgver=1.0.0
pkgrel=1
pkgdesc="Media Center based on EFL"
arch=('any')
url="https://github.com/DaveMDS/epymc"
license=('GPL3')
depends=('python2-efl')
optdepends=('lirc: remote contol support'
            'mutagen: Music module'
            'python2-beautifulsoup4: Online Channels module'
            'sdlmame: MAME module')
install=$pkgname.install
source=("https://github.com/DaveMDS/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('062d1ad370f0abeb08d537e5d89d4895ea03eff3363262ab26dfee37b6d55a7d')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i 's/env python$/&2/' $(find -name "*.py" 2> /dev/null) epymc/extapi/youtube-dl
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --root="$pkgdir" --optimize=1
}
