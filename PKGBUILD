# Maintainer: dryes <joswiseman@cock.li>
pkgname='newsmangler-git'
pkgver=154
pkgrel=1
pkgdesc='NNTP binary poster with mulitple connection support.'
url='http://github.com/madcowfred'
arch=('any')
license=('Custom')
depends=('par2cmdline' 'python2' 'python2-yenc')
optdepends=('mysql' 'postgresql' 'sqlite' 'python2-pyopenssl')
makedepends=('git')
source=('git://github.com/nicors57/newsmangler')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  echo $(git rev-list --count master)
}

package() {
  mkdir -p "${pkgdir}/usr/"{bin,share}
  cp -r "${srcdir}/newsmangler" "${pkgdir}/usr/share/"
  cd "${pkgdir}/usr/share/newsmangler"
  
  rm -rf .git .gitignore

  for _py in mangler.py newsmangler/*.py; do
    sed -i -r 's|^\#\!/usr/bin/env python$|\#\!/usr/bin/python2|i' "${_py}"
  done

  ln -s "/usr/share/newsmangler/mangler.py" "${pkgdir}/usr/bin/mangler"
  chmod +x "${pkgdir}/usr/share/newsmangler/mangler.py"
}
