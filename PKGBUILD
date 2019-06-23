# Generated with help from pip2pkgbuild - https://github.com/wenLiangcan/pip2pkgbuild
# Maintainer: MayorBender <7480812+kingy9000@users.noreply.github.com>

pkgname=submit50
_module='submit50' # PyPI specific
pkgver=2.4.11
pkgrel=1
pkgdesc="This is submit50, with which you can submit solutions to problems for CS50."
arch=('any')
url="https://github.com/cs50/submit50"
license=('GPL')
depends=('python' 'python-pexpect')
makedepends=('python-setuptools' 'python-pip')

# Pass variables to child processes - Used to check if need to install other dependencies
export backports_shutil_which
export backports_shutil_get_terminal_size

prepare() {
	# Check if dependency backports.shutil-which is installed
	if ! pip list | grep backports.shutil-which; then
		backports_shutil_which=1
	else
		backports_shutil_which=0
	fi

	# Check if dependency backports.shutil-get-terminal-size is installed
	if ! pip list | grep backports.shutil-get-terminal-size; then
		backports_shutil_get_terminal_size=1
	else
		backports_shutil_get_terminal_size=0
	fi
}

package() {
	# Install dependency backports.shutil-which if not already installed
	if [ "$backports_shutil_which" -eq "1" ]; then
		echo -e "\033[0;31mDependency backports.shutil-which not found. Adding to package.\033[0m"
		PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps backports.shutil-which
	fi

	# Install dependency backports.shutil-get-terminal-size if not already installed
	if [ "$backports_shutil_get_terminal_size" -eq "1" ]; then
		echo -e "\033[0;31mDependency backports.shutil-get-terminal-size not found. Adding to package.\033[0m"
		PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps backports.shutil-get-terminal-size
	fi

	# Install submit50
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps submit50
}
