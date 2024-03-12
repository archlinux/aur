# Maintainer: drzee <info@drzee.net>
pkgname=codedeploy-agent-bin
pkgver=1.7.0_92
pkgrel=1
pkgdesc="AWS CodeDeploy is a deployment service that enables developers to automate the deployment of applications to instances and to update the applications as required."
arch=('x86_64')
url="https://aws.amazon.com/documentation/codedeploy/"
license=('APACHE')
groups=()
depends=('ruby')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=(https://aws-codedeploy-eu-west-1.s3-eu-west-1.amazonaws.com/releases/${pkgname%-bin}_${pkgver//_/-}_all.deb)
md5sums=('0d902cf8b576b0565123989f47135ce6')
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

