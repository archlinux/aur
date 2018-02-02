# Maintainer: Louis Bettens louis at bettens dot info

# Note: the github repo is behind the gem, so screw it I will download the gem directly

_gemname=data_uri
pkgname=ruby-${_gemname}
pkgver=0.1.0
pkgrel=1
pkgdesc='URI class for parsing data URIs'
url=${__github}
arch=('any')
license=('MIT')
depends=('ruby')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=(https://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
sha256sums=('7eb2f63487ccb943fae0eca561729c48d4d5654d76f8330aa16ed1dcdbebf33b')
sha512sums=('88eef1dd3ef28de80a1de3dcd7e9fc33cf54235f9eb0e060ea7bb214494c738d35f0236d03533e3a1c2aa4531ae1df522a03ecbb34e489a1960bd964cfb08f52')

build() {
cat <<END >>LICENSE.txt  # taken from README.rdoc
(The MIT License)

Copyright (c) 2010 Donald Ball <donald.ball@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
END
}

package() {
  cd ${_gemname}-${pkgver}
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
