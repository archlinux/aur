# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid
# Package Source: https://github.com/flaccid/archlinux-packages/blob/master/aws-cli-git/PKGBUILD

set -u
_pkgname='aws-cli'
pkgname="${_pkgname}-git"
_srcdir="${pkgname}"
pkgver=1.1.0.r1966.g45bb0b6
pkgrel=1
pkgdesc='Universal Command Line Interface for Amazon Web Services.'
arch=('any')
url='https://github.com/aws/aws-cli/'
license=('Apache 2')
depends=(
  'python'
  'python-botocore'
  'python-colorama'
  'python-docutils'
  'python-bcdoc'
  'python-rsa'
  'python-jmespath'
  'python-mock'
  'python-nose'
  'python-rsa'
  'python-six'
  'python-sphinx'
  'python-tox'
)
makedepends=('python-distribute' 'git')
conflicts=('python2-aws-cli' 'python-aws-cli' 'awscli' "${_pkgname}")
replaces=('python2-aws-cli'  'python-aws-cli' 'awscli' "${_pkgname}")
provides=('awscli' "${_pkgname}")
options=('!emptydirs')
source=("${pkgname}::git://github.com/aws/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  set -u
  cd "${_srcdir}"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  python setup.py install --root="${pkgdir}/" --optimize=1

  msg 'Install zsh completion script.'
  install -Dpm644 'bin/aws_zsh_completer.sh' "${pkgdir}/etc/zsh/aws_complete.zsh"

  msg 'Install requirements.txt.'
  install -Dpm644 'requirements.txt' "${pkgdir}/usr/share/doc/${_pkgname}/requirements.txt"

  msg 'Install LICENSE.'
  install -Dpm644 'LICENSE.txt' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
