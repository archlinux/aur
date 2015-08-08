# $Id$
# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Chris Fordham <chris at fordham-nagy dot id dot au> aka flaccid
# Contributor: Alper KANAT <alperkanat@raptiye.org>
# Package Source: https://github.com/flaccid/archlinux-packages/blob/master/aws-cli/PKGBUILD

set -u
pkgname='aws-cli'
pkgver='1.7.44'
pkgrel='1'
pkgdesc='Universal Command Line Interface for Amazon Web Services.'
arch=('any')
url='https://github.com/aws/aws-cli'
license=('Apache 2')
depends=(
  'python'
  'python-bcdoc<0.15.0'
  'python-botocore'
  'python-colorama<0.4.0'
  'python-docutils>=0.10'
  'python-rsa<3.2.0'
)
makedepends=('python-setuptools')
conflicts=('python2-aws-cli' 'python-aws-cli' 'awscli')
replaces=(                   'python-aws-cli' 'awscli')
options=('!emptydirs')
source=("https://github.com/aws/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('7f3b6778ea526af1dbcf21007f98b375fadc69e342114be5dc5a7d5cf5f5b097')

package() {
  set -u
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1

  msg 'Install zsh completion script.'
  install -Dpm644 'bin/aws_zsh_completer.sh' "${pkgdir}/etc/zsh/aws_complete.zsh"

  msg 'Install requirements.txt.'
  install -Dpm644 'requirements.txt' -t "${pkgdir}/usr/share/doc/${pkgname}/"

  msg 'Install LICENSE.'
  install -Dpm644 'LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
