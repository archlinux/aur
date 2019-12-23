# Maintainer:  kngfr <9bcfbc1ca230857ba09584697f20708a@kngfr.de>
pkgname=phoneinfoga
_reponame=PhoneInfoga
pkgver=v1.10.12.r7.gca80958
pkgrel=1
pkgdesc="Advanced information gathering & OSINT tool for phone numbers."
arch=('any')
url="https://sundowndev.github.io/PhoneInfoga/"
license=('GPL')
depends=('python3'
	 'python-requests'
	 'python-beautifulsoup4'
	 'python-html5lib'
	 'python-phonenumbers'
	 'python-urllib3'
	 'python-colorama')
optdepends=('geckodriver')
source=("git+https://github.com/sundowndev/PhoneInfoga")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_reponame"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_reponame"

  install -Dt "$pkgdir"/usr/share/"$pkgname" phoneinfoga.py
  install -Dt "$pkgdir"/usr/share/"$pkgname"/lib "$srcdir/$_reponame"/lib/*
  install -Dt "$pkgdir"/usr/share/"$pkgname"/scanners "$srcdir/$_reponame"/scanners/*
  install -D config.example.py "$pkgdir"/usr/share/"$pkgname"/config.py

  printf "#!/bin/sh\npython3 '/usr/share/$pkgname/phoneinfoga.py' "'$@' > "$srcdir/$_reponame"/phoneinfoga
  install -Dm755 "$srcdir/$_reponame"/phoneinfoga "$pkgdir"/usr/bin/phoneinfoga
  
  install -Dt "$pkgdir"/usr/share/licenses/"$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:
