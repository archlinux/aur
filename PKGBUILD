# Maintainer: Haonan Chen <g897331845@gmail.com>

# You need to manyally create tarball first.
# 1.    Create a clean archlinux root with necessary packages
#           sudo mkdir -p /root/chroot/lowwer
#           sudo pacstrap /root/chroot/lowwer base base-devel vim xorg
#       also remember to enable necessary locales and install some fonts
#       (otherwise non-English letters will not show properly)
#       after that, copy comsol iso and license file into /root/chroot/lowwer
# 2.    create overlayfs 
#           sudo mkdir -p /root/chroot/upper
#           sudo mkdir -p /root/chroot/work
#           sudo mkdir -p /root/chroot/overlay
#           sudo mount -t overlay overlay -o upperdir=/root/chroot/upper,lowerdir=/root/chroot/lowwer,workdir=/root/chroot/work overlay
# 3.    jump into chroot with GUI application support
#           xhost +local:
#           sudo arch-chroot /root/chroot/overlay
#           export $DISPLAY=:0
# 4.    install comsol normally. not to install to /opt/comsol56/multiphysics and check "install desktop entry"
# 5.    exit and create tarball
#           sudo umount /root/chroot/overlay
#           sudo -i
#           cd /root/chroot/upper
#           tar -cpf - opt usr | xz -T0 -c - > comsol-multiphysics.tar.xz
# 6.    that's all. just delete junk file to release disk space.


pkgname=comsol-multiphysics
pkgver=5.6.0.401
pkgrel=1
pkgdesc='A general-purpose simulation software for modeling designs, devices, and processes in all fields of engineering, manufacturing, and scientific research'
arch=('x86_64')
url='https://www.comsol.com/comsol-multiphysics'
license=(custom)
source=("file://comsol-multiphysics.tar.xz")
sha256sums=(SKIP)
OPTIONS=(!strip docs libtool staticlibs)

package()
{
    cp -r ${srcdir}/{opt,usr} ${pkgdir}/
}
