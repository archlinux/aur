# Maintainer: drzee <info@drzee.net>
pkgname=codedeploy-agent-bin
pkgver=1.7.0_78
pkgrel=1
pkgdesc="AWS CodeDeploy is a deployment service that enables developers to automate the deployment of applications to instances and to update the applications as required."
arch=('x86_64')
url="https://aws.amazon.com/documentation/codedeploy/"
license=('APACHE')
groups=()
depends=('ruby' 'systemd')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=(https://aws-codedeploy-eu-west-1.s3-eu-west-1.amazonaws.com/releases/${pkgname%-bin}_${pkgver//_/-}_all.deb)
md5sums=('d8a398cf3efa88aec9dd381a731d1feb')
noextract=()

prepare() {
  cd "$srcdir"
  tar -xf data.tar.gz
  
}

package() {
  cd "$srcdir"

  install -dm755 "$pkgdir"/opt/
  cp -R "${srcdir}"/opt/codedeploy-agent "${pkgdir}/opt/"

  install -Dm744 \
      "$srcdir"/etc/codedeploy-agent/conf/codedeployagent.yml \
      "$pkgdir"/etc/codedeploy-agent/conf/codedeployagent.yml

  install -Dm644 \
      "$srcdir"/etc/init.d/codedeploy-agent.service \
      "$pkgdir"/usr/lib/systemd/system/codedeploy-agent.service
      
}

