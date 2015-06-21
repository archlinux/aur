# Maintainer: Holzhaus <jan.holthuis@ruhr-uni-bochum.de>

pkgname='pyload-nightly'
pkgver=0.4.9.9dev
pkgrel=1
pkgdesc="Downloadtool for One-Click-Hoster written in python. Nightly build of pyload 0.5 public beta."
url="http://beta.pyload.org/index.php/5-pyload-beta"
license=('GPL')
arch=('any')
provides=('pyload')
conflicts=('pyload' 'pyload-hg')
backup=('var/lib/pyload/pyload.conf')
depends=('python2>=2.5.0' 'python2<2.8.0'
         'python2-pycurl'
         'python2-jinja'
         'python2-beaker')
optdepends=('python2-crypto: RSDF/CCF/DLC support'
            'tesseract: Automatic captcha recognition for a small amount of plugins'
            'python2-pillow: Automatic captcha recognition for a small amount of plugins'
	    'js: Used for several hoster, ClickNLoad'
            'python2-feedparser: Feedparser support'
            'python2-beautifulsoup4: BeautifulSoup support'
            'python2-pyopenssl: For SSL connection'
            'python2-flup: for additional webservers')
source=('http://nightly.pyload.org/job/Nightly/lastSuccessfulBuild/artifact/dist/pyload-0.4.9.9-dev.tar.gz'
	'pyload.service'
	'pyload.conf')
md5sums=('SKIP'
         'd34a58f919ecf5e53da1c8986e62a1fe'
	 'e8aa7a9b1ef8ba58a3fdaaf3a43e98a3')
install='pyload-nightly.install'

package() {
  cd $srcdir
  tar xzvf pyload-0.4.9.9-dev.tar.gz
  cd pyload-0.4.9.9-dev
  sed -i 's_#!/usr/bin/env python$_#!/usr/bin/env python2_' pyload*.py
  install -d ${pkgdir}/opt/pyload

  cp -r * ${pkgdir}/opt/pyload

  install -d ${pkgdir}/usr/bin
  ln -s /opt/pyload/pyload.py ${pkgdir}/usr/bin/pyload
  ln -s /opt/pyload/pyload-cli.py ${pkgdir}/usr/bin/pyload-cli

  # Create pyload service
  install -Dm 644 ${srcdir}/pyload.service ${pkgdir}/usr/lib/systemd/system/pyload.service
  install -Dm 644 ${srcdir}/pyload.conf ${pkgdir}/var/lib/pyload/pyload.conf
}

