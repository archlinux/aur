#Submitter: Ian Ker-Seymer <i.kerseymer@gmail.com>
#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

_md5sum=$(curl -s https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest.md5)
pkgname=aws-ecs-cli
pkgver=1.12.1
pkgrel=1
pkgdesc="The Amazon EC2 Container Service (Amazon ECS) command line interface (CLI) provides high-level commands to simplify creating, updating, and monitoring clusters and tasks from a local development environment."
makedepends=('curl')
arch=('x86_64')
options=(!strip)
source=("ecs-cli-$_md5sum::https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest")
url="https://github.com/aws/amazon-ecs-cli"
license=("Apache")
md5sums=("$_md5sum")

pkgver() {
  cd "$srcdir"
  chmod +x "ecs-cli-$_md5sum"
  ./ecs-cli-$_md5sum -v | sed -rn 's/ecs-cli version ([0-9\.]+) \(\w+\)/\1/p'
}

package() {
  cd "$srcdir"
  chmod +x "ecs-cli-$_md5sum"
  install -Dm755 "ecs-cli-$_md5sum" "$pkgdir/usr/bin/ecs-cli"
}
