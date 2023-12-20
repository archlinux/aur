# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: Jack Rubacha  <rubacha.jack03@gmail.com>
# Contributor: Paul Nicholson <brenix@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Chris <seitz.christoph@gmail.com>
# Contributor: m0ikz <ndelatorre@moikz.com.ar>
# Contributor: atweiden <archbaum@gmail.com>

pkgname=ansible-core-git
pkgver=r51467.a30c55f68a
pkgrel=1
pkgdesc='Radically simple IT automation platform'
arch=('any')
url='https://github.com/ansible/ansible'
license=('GPL3')
depends=('python' 'python-yaml' 'python-paramiko' 'python-jinja' 'python-resolvelib')
provides=('ansible-core' 'python-ansible')
replaces=('ansible-core' 'python-ansible')
conflicts=('ansible-core' 'python-ansible')
optdepends=('sshpass: for ssh connections with password'
            'python-passlib: crypt values for vars_prompt'
            'python-netaddr: for the ipaddr filter'
            'python-systemd: log to journal'
            'python-pywinrm: connect to Windows machines'
            'python-dnspython: for dig lookup'
            'python-jmespath: json_query support')
makedepends=('python-setuptools' 'git')
backup=('etc/ansible/ansible.cfg')
source=($pkgname::git+https://github.com/ansible/ansible.git)
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}"/${pkgname}
  python setup.py build
}

package() {
  cd ${pkgname}
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm644 COPYING "${pkgdir}"/usr/share/doc/${pkgname}/COPYING
}
